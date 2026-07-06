-- AUTO-GENERATED: OP10-092 / 페로나
-- rules_id=OP10-092 script_id=880001307 fingerprint=49b8d92b0186af41090fc80c35d9bfe93ee719b673bfb52c77880fcead4c4f86
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP10-092]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=2000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              filter={
                name_neq=[[페로나]],
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={
          {
            count=2,
            filter={
              trait=[[스릴러 바크 해적단]],
            },
            op=[[RETURN_TRASH_TO_DECK_BOTTOM]],
            order=[[CHOOSE]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【기동: 메인】【턴 1회】자신의 트래시에서 《스릴러 바크 해적단》 특징을 가진 카드 2장을 원하는 순서대로 덱 맨 아래로 되돌릴 수 있다: 이번 턴 동안, 자신의 「페로나」 이외의 캐릭터 1장까지의 파워 +2000.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP10-092]],
    schema_version=1,
  })
end
