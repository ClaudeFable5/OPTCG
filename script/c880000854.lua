-- AUTO-GENERATED: OP07-001 / 몽키 D. 드래곤
-- rules_id=OP07-001 script_id=880000854 fingerprint=f8cebb3fe62899cc5bd00cf1382d21c37ea429a865281568b2de529eeb0ddaf3
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP07-001]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=2,
            mode=[[UP_TO]],
            op=[[TRANSFER_ATTACHED_DON]],
            player=[[YOU]],
            selector={
              count=1,
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【기동: 메인】【턴 1회】자신의 부여되어 있는 두웅!!을 합계 2장까지 자신의 캐릭터 1장에게 부여한다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP07-001]],
    schema_version=1,
  })
end
