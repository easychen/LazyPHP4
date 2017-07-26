<!-- Footer -->
<footer>
    <div class="container">
        <div class="row">
            <div class="col-lg-10 col-lg-offset-1 text-center">
                <p>点此加入 <a href="http://zhijia.io/circle/102334" target="_blank">营销号的自我修养社群</a></p>
                <br>
                <hr class="small">
                <p class="text-muted">Copyright &copy; <?=date("Y")?> 方糖气球🎈 &amp; 爆米花学院 🍿 联合出品 </p>
            </div>
        </div>
    </div>
</footer>

<!-- jQuery first, then Bootstrap JS. -->
<script src="http://lib.sinaapp.com/js/jquery/2.2.4/jquery-2.2.4.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="http://lib.sinaapp.com/js/bootstrap/3.0.0/js/bootstrap.min.js"></script>

<?php if( isset($data['js']) && is_array( $data['js'] ) ): ?>
    <?php foreach( $data['js'] as $jfile ): ?><script type="text/javascript" src="/assets/script/<?=$jfile;?>" ></script>
    <?php endforeach; ?>
<?php endif; ?>

 <script type="text/javascript" src="/assets/script/app.js" ></script>



    
