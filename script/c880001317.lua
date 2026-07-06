-- AUTO-GENERATED: OP10-102 / 엠포리오 이반코프
-- rules_id=OP10-102 script_id=880001317 fingerprint=16afeba630ac91777720185207cea6ea855b213b5bc101ec7499fe5cdc2ea576
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP10-102]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=1000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=3,
              filter={
                trait=[[혁명군]],
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
          {
            count=1,
            op=[[TAKE_LIFE_TO_HAND]],
            player=[[YOU]],
            position=[[TOP]],
            ["then"]=true,
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【기동: 메인】【턴 1회】이번 턴 동안, 자신의 《혁명군》 특징을 가진 캐릭터 3장까지의 파워 +1000. 그 후, 자신의 라이프 위에서 1장을 패에 더한다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP10-102]],
    schema_version=1,
  })
end
