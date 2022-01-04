#!/bin/sh

cd ../exper/

python test_sst.py \
    --arch=vgg_sst \
    --dataset=cub \
    --img_dir=../data/CUB_200_2011/images \
    --test_list=../data/CUB_200_2011/list/test.txt \
    --test_box=../data/CUB_200_2011/list/test_boxes.txt \
    --num_classes=200 \
    --scg_com \
    --scg_blocks=4,5 \
    --sos_seg_method=TC \
    --sos_loss_method=BCE \
    --sa_edge_stage=4,5 \
    --snapshot_dir=../snapshots/vgg16_sos+sa_v3_repo_#1 \
    --debug_dir=../debug/vgg16_sos+sa_v3_repo_#1_t1 \
    --batch_size=10 \
    --restore_from=cub_epoch_100.pth.tar \
    --threshold=0.05,0.5 \
    --scg_fosc_th=0.2 \
    --scg_sosc_th=1 \
    --gpus=1 \
    --sa_head=8 \
    --sa_neu_num=512 \
    --sa_use_edge=True \
    --mode=sos+sa_v3 \
    --debug \
    --debug_num=10 \
#    --debug_only \
