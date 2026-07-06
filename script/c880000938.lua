-- AUTO-GENERATED: OP07-083 / 겟코 모리아
-- rules_id=OP07-083 script_id=880000938 fingerprint=37fa3851f4d04775cfd8b2df7a4c47f181550845e153008464505817c4889632
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP07-083]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[THIS_TURN]],
            keyword=[[BANISH]],
            op=[[GAIN_KEYWORD]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
          {
            amount=1000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={
          {
            count=4,
            filter={
              trait=[[스릴러 바크 해적단]],
            },
            op=[[RETURN_TRASH_TO_DECK_BOTTOM]],
            order=[[CHOOSE]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【기동: 메인】자신의 트래시에서 《스릴러 바크 해적단》 특징을 가진 카드 4장을 원하는 순서대로 덱 맨 아래로 되돌릴 수 있다: 이번 턴 동안, 이 캐릭터는 【배니시】를 얻고, 파워 +1000.
(이 카드가 대미지를 주었을 경우, 트리거는 발동하지 않으며 그 카드는 트래시로 보내진다)]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP07-083]],
    schema_version=1,
  })
end
